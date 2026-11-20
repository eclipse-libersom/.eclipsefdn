local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local default_branch_protection_rules = [
  orgs.newBranchProtectionRule('main') {
    required_approving_review_count: 1,
    required_status_checks+: [],
  },
];

orgs.newOrg('automotive.libersom', 'eclipse-libersom') {
  settings+: {
    default_repository_permission: "none",
    description: "",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_create_private_repositories: false,
    members_can_create_public_repositories: false,
    members_can_create_teams: false,
    members_can_delete_repositories: false,
    name: "Eclipse Libersom project",
    packages_containers_internal: false,
    packages_containers_public: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
} + {
  # snippet added due to 'https://github.com/eclipsefdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
   _repositories+:: [
      orgs.newRepo('.github') {
        allow_merge_commit: true,
        allow_update_branch: false,
        delete_branch_on_merge: false,
        description: "Eclipse LIBERSOM .github",
        homepage: "",
        web_commit_signoff_required: false,
        branch_protection_rules+: default_branch_protection_rules,
        workflows+: {
          default_workflow_permissions: "write",
        },
      },
    orgs.newRepo('libersom') {
        allow_merge_commit: true,
        allow_update_branch: false,
        delete_branch_on_merge: false,
        description: "Eclipse LIBERSOM main repo",
        homepage: "",
        web_commit_signoff_required: false,
        branch_protection_rules+: default_branch_protection_rules,
        workflows+: {
          default_workflow_permissions: "write",
        },
      },
    orgs.newRepo('libersom-python') {
        allow_merge_commit: true,
        allow_update_branch: false,
        delete_branch_on_merge: false,
        description: "A python binding for Eclipse LIBERSOM",
        homepage: "",
        web_commit_signoff_required: false,
        branch_protection_rules+: default_branch_protection_rules,
        workflows+: {
          default_workflow_permissions: "write",
        },
      },
    orgs.newRepo('libersom-rs-bind') {
        allow_merge_commit: true,
        allow_update_branch: false,
        delete_branch_on_merge: false,
        description: "Ferrocene-subset Rust bindings for Eclipse LIBERSOM",
        homepage: "",
        web_commit_signoff_required: false,
        branch_protection_rules+: default_branch_protection_rules,
        workflows+: {
          default_workflow_permissions: "write",
        },
      },
    orgs.newRepo('libersom-examples') {
        allow_merge_commit: true,
        allow_update_branch: false,
        delete_branch_on_merge: false,
        description: "Eclipse LIBERSOM examples",
        homepage: "",
        web_commit_signoff_required: false,
        branch_protection_rules+: default_branch_protection_rules,
        workflows+: {
          default_workflow_permissions: "write",
        },
      },
    orgs.newRepo('libersom-gateways') {
        allow_merge_commit: true,
        allow_update_branch: false,
        delete_branch_on_merge: false,
        description: "Eclipse LIBERSOM Protocol gateways for OpenSOME/IP: bridges between SOME/IP and gRPC, MQTT, iceoryx2, ROS2, Zenoh, D-Bus, and DDS",
        homepage: "",
        web_commit_signoff_required: false,
        branch_protection_rules+: default_branch_protection_rules,
        workflows+: {
          default_workflow_permissions: "write",
        },
      },
  ],
}
