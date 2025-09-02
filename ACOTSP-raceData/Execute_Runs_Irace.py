import os
import shutil
import subprocess
import concurrent.futures

# Function to execute a hyperparameter tuning scenario
def execute_scenario(path: str, seed: int, id_scenario: int, parallel: int = 1):
    """
    Execute a hyperparameter tuning scenario.

    Args:
        path (str): Path of the scenario.
        seed (int): Random seed.
        id_scenario (int): Scenario ID.
        parallel (int): Number of threads for the scenario.
    """
    scenario_file = os.path.join(path, 'scenario.txt')

    with open(scenario_file, 'a') as file:
        file.write("\n## Seed\n")
        file.write(f"seed={seed}\n")
        file.write("\n## Scenario ID\n")
        file.write(f"#id_scenario={id_scenario}\n")
        file.write("\n## Number of threads\n")
        file.write(f"parallel={parallel}\n")

    command = "Rscript execute_irace.R > output.log"
    subprocess.run(command, shell=True, cwd=path)

    print(f"Scenary {id_scenario} ready (path={path}, seed={seed})")

# Directories for base scenarios, destination and scenario names
directories = [
    ['Scenarios/BL-22/Base', 'Scenarios/BL-22/Runs', 'BL-22'],
    ['Scenarios/BL-45/Base', 'Scenarios/BL-45/Runs', 'BL-45'],
    ['Scenarios/BH-45/Base', 'Scenarios/BH-45/Runs', 'BH-45'],
    ['Scenarios/BH-90/Base', 'Scenarios/BH-90/Runs', 'BH-90'],
]

# Random seeds for each combination
seeds = [
    2314, 9876543210,
]

# List to store data for each run
runs_data = []

# Generate combinations of base scenarios and seeds
for base_dir, dest_dir, scenary_type in directories:
    # Verify existence of base directory
    if not os.path.exists(base_dir):
        raise FileNotFoundError(f"The base directory '{base_dir}' does not exist.")
    # ID that represents the run for each combination of scenario and seed
    run_id = 1
    # Create destination directory if it doesn't exist for each scenario-seed combination
    for seed in seeds:
        # Create a unique path for each scenario-seed combination
        path = os.path.join(dest_dir, f"{scenary_type}_seed_{seed}")
        os.makedirs(path, exist_ok=True)
        shutil.copytree(base_dir, path, dirs_exist_ok=True)
        runs_data.append((path, seed, run_id))
        run_id += 1

# Total number of scenarios to run
N = len(runs_data)  # Total number of scenarios
K = 2           # Maximum number of simultaneous executions
parallel = 10    # Number of threads for each scenario

print(f"Total number of scenarios: {N}\n")
print(f"Maximum number of simultaneous executions: {K}\n")
print(f"Number of threads for each scenario: {parallel}\n")

# Execute scenarios in parallel
with concurrent.futures.ThreadPoolExecutor(max_workers=K) as executor:
    futures = {executor.submit(execute_scenario, path, seed, run_id, parallel): [path, seed, run_id] for path, seed, run_id in runs_data}
    print("Executing scenarios...\n", flush=True)
    for future in concurrent.futures.as_completed(futures):
        path, seed, run_id = futures[future]
        print(f"Scenario {path} completed (seed={seed}, run_id={run_id})\n", flush=True)
    print("All scenarios executed successfully.\n", flush=True)
