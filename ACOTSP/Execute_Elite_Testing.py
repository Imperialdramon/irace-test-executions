import os
import shutil
import subprocess
import concurrent.futures
import argparse
from pathlib import Path

# Function to execute an elite testing scenario
def execute_elite_testing(path: str, seed: int, run_id: int, parallel_irace: int = 1, configurations_file: str = "configurations.txt"):
    """
    Execute an elite testing scenario with only-test mode.

    Args:
        path (str): Path of the testing scenario.
        seed (int): Random seed.
        run_id (int): Run ID.
        parallel_irace (int): Number of parallel threads for irace.
        configurations_file (str): Name of the configurations file to test.
    """
    scenario_file = os.path.join(path, 'scenario.txt')

    # Append seed and other configurations to scenario.txt
    with open(scenario_file, 'a') as file:
        file.write("\n## Run ID\n")
        file.write(f"# run_id={run_id}\n")
        file.write("\n## Seed\n")
        file.write(f"seed={seed}\n")
        file.write("\n## Number of parallel threads for irace\n")
        file.write(f"parallel={parallel_irace}\n")

    # Execute Rscript with the execute_irace.R script
    command = "Rscript execute_irace.R > output.log 2>&1"
    result = subprocess.run(command, shell=True, cwd=path, capture_output=False)

    if result.returncode == 0:
        print(f"✓ Elite Testing Run {run_id} completed successfully (path={path}, seed={seed})")
    else:
        print(f"✗ Elite Testing Run {run_id} failed (path={path}, seed={seed})")

    return result.returncode == 0


def main():
    """
    Main function to orchestrate elite testing executions.
    """
    parser = argparse.ArgumentParser(
        description="Execute elite testing scenarios with multiple seeds and optional parallelization."
    )
    parser.add_argument(
        "--base-dir",
        type=str,
        default="Scenarios/Elites-4/Base",
        help="Path to the base directory containing elite testing configuration (default: Scenarios/Elites-4/Base)"
    )
    parser.add_argument(
        "--output-dir",
        type=str,
        default="Scenarios/Elites-4/Runs",
        help="Path to the output directory where runs will be created (default: Scenarios/Elites-4/Runs)"
    )
    parser.add_argument(
        "--scenario-name",
        type=str,
        default="Elites-4",
        help="Name of the scenario for naming runs (default: Elites-4)"
    )
    parser.add_argument(
        "--seeds",
        type=int,
        nargs="+",
        default=[
            100003, 200009, 300017, 400031, 500057,
            600083, 700099, 800123, 900149, 1000193,
            1100211, 1200239, 1300277, 1400299, 1500311,
            1600333, 1700359, 1800371, 1900393, 2000419
        ],
        help="Random seeds for testing (default: 20 predefined seeds)"
    )
    parser.add_argument(
        "--parallel-python",
        type=int,
        default=1,
        help="Number of simultaneous Python executions (default: 1, sequential execution)"
    )
    parser.add_argument(
        "--parallel-irace",
        type=int,
        default=1,
        help="Number of parallel threads for each irace execution (added to scenario.txt)"
    )
    parser.add_argument(
        "--configurations-file",
        type=str,
        default="configurations.txt",
        help="Name of the configurations file to test (default: configurations.txt)"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Show what would be executed without actually running"
    )

    args = parser.parse_args()

    base_dir = args.base_dir
    output_dir = args.output_dir
    scenario_name = args.scenario_name
    seeds = args.seeds
    max_parallel_python = args.parallel_python
    parallel_irace = args.parallel_irace
    configurations_file = args.configurations_file
    dry_run = args.dry_run

    # Verify existence of base directory
    if not os.path.exists(base_dir):
        raise FileNotFoundError(f"The base directory '{base_dir}' does not exist.")
    
    # Check if configurations.txt exists in base directory
    config_path = os.path.join(base_dir, configurations_file)
    if not os.path.exists(config_path):
        raise FileNotFoundError(
            f"The configurations file '{configurations_file}' does not exist in '{base_dir}'."
        )

    # List to store data for each run
    runs_data = []

    # Create runs directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)

    # Generate runs for each seed
    run_id = 1
    for seed in seeds:
        # Create a unique path for each seed
        run_path = os.path.join(output_dir, f"{scenario_name}_seed_{seed}")
        
        # Skip if directory already exists (avoid overwriting)
        if os.path.exists(run_path):
            print(f"⊘ Skipping {run_path} (already exists)")
            run_id += 1
            continue
        
        # Create directory and copy base files
        os.makedirs(run_path, exist_ok=True)
        shutil.copytree(base_dir, run_path, dirs_exist_ok=True)
        
        runs_data.append((run_path, seed, run_id, configurations_file))
        run_id += 1

    # Total number of runs
    N = len(runs_data)

    print("\n" + "="*70)
    print("ELITE TESTING CONFIGURATION")
    print("="*70)
    print(f"Base directory:              {base_dir}")
    print(f"Output directory:            {output_dir}")
    print(f"Scenario name:               {scenario_name}")
    print(f"Configurations file:         {configurations_file}")
    print(f"Total number of runs:        {N}")
    print(f"Maximum parallel Python:     {max_parallel_python}")
    print(f"Parallel irace threads:      {parallel_irace}")
    print(f"Number of seeds:             {len(seeds)}")
    print("="*70 + "\n")

    if N == 0:
        print("No new runs to execute (all already exist or no seeds provided).\n")
        return

    if dry_run:
        print("DRY RUN MODE - No executions will be performed.\n")
        print("Runs that would be created:")
        for i, (run_path, seed, run_id, _) in enumerate(runs_data, 1):
            print(f"  {i}. {run_path} (seed={seed}, run_id={run_id})")
        print()
        return

    # Execute scenarios in parallel
    successful_runs = 0
    failed_runs = 0

    try:
        with concurrent.futures.ThreadPoolExecutor(max_workers=max_parallel_python) as executor:
            futures = {
                executor.submit(
                    execute_elite_testing,
                    run_path,
                    seed,
                    run_id,
                    parallel_irace,
                    configurations_file
                ): (run_path, seed, run_id)
                for run_path, seed, run_id, _ in runs_data
            }

            print(f"Executing {N} elite testing runs...\n")

            for future in concurrent.futures.as_completed(futures):
                run_path, seed, run_id = futures[future]
                try:
                    success = future.result()
                    if success:
                        successful_runs += 1
                    else:
                        failed_runs += 1
                except Exception as e:
                    print(f"✗ Exception in run {run_id} (seed={seed}): {e}")
                    failed_runs += 1

    except KeyboardInterrupt:
        print("\n\nExecution interrupted by user.")
        executor.shutdown(wait=False)
        return

    print("\n" + "="*70)
    print("EXECUTION SUMMARY")
    print("="*70)
    print(f"Total runs:        {N}")
    print(f"Successful:        {successful_runs}")
    print(f"Failed:            {failed_runs}")
    print("="*70 + "\n")


if __name__ == "__main__":
    main()
