workflow "New workflow" {
  on = "push"
  resolves = ["test run"]
}

action "build" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "build -t elephantum/test-actions:latest ."
}

action "test run" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build"]
  args = "run --rm elephantum/test-actions:latest"
}
