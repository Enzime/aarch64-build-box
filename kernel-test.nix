{ lib, fetchFromGitHub, buildLinux, ... } @ args:

with lib;

buildLinux (args // rec {
  version = "6.99.99";

  # modDirVersion needs to be x.y.z, will automatically add .0 if needed
  modDirVersion = versions.pad 3 version;

  # branchVersion needs to be x.y
  extraMeta.branch = versions.majorMinor version;

  src = builtins.fetchGit {
    url = "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git";
    rev = "17d99ea98b6238e7e483fba27e8f7a7842d0f345";
  };
} // (args.argsOverride or { }))
