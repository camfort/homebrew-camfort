# CamFort Homebrew formula
Plus a semi-automated GitHub Actions CI setup for publishing bottles.

## Users: Use
    brew install camfort/camfort/camfort

## Devs: Release
https://brew.sh/2020/11/18/homebrew-tap-with-bottles-uploaded-to-github-releases/

  1. Make a PR for the release.
  2. A test workflow should run. When green and ready to merge, label with
     `pr-pull`.
  3. Lots of automation stuff magically happens. You should be good to go.

My understanding of the automation from what I've observed:

  * a GitHub release is made with the bottle artifact from the previous workflow
  * a commit is made to merge the PR changes along with adding a bottle clause
    to the formula
  * the PR is *closed*, not merged, and the branch deleted

## Help
For Homebrew help, try `brew help`, `man brew` or check [Homebrew's
documentation](https://docs.brew.sh).
