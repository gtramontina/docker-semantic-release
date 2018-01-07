<p align="center">
  <a href="https://hub.docker.com/r/gtramontina/semantic-release/tags/"><img height="20" alt="Docker Tags" src="https://img.shields.io/badge/dynamic/json.svg?style=for-the-badge&label=%F0%9F%90%B3%20tags&colorB=066da5&query=$.count&uri=https%3A%2F%2Fhub.docker.com%2Fv2%2Frepositories%2Fgtramontina%2Fsemantic-release%2Ftags"></a>
  <a href="https://hub.docker.com/r/gtramontina/semantic-release/tags/"><img height="20" alt="Docker Latest Tag" src="https://img.shields.io/badge/dynamic/json.svg?style=for-the-badge&label=%F0%9F%90%B3%20latest%20tag&colorB=066da5&query=$.results[0].name&uri=https%3A%2F%2Fhub.docker.com%2Fv2%2Frepositories%2Fgtramontina%2Fsemantic-release%2Ftags"></a>
  <a href="https://travis-ci.org/gtramontina/docker-semantic-release"><img height="20" alt="Travis" src="https://img.shields.io/travis/gtramontina/docker-semantic-release.svg?style=for-the-badge"></a>
</p>

<p align="center">
  Docker image for <a href="https://github.com/semantic-release/semantic-release"><code>semantic-release</code></a>
</p>

---

#### _Running:_

```sh
$ docker run --rm gtramontina/semantic-release:<version>
```

**Note**: Because running `semantic-release` alone automatically runs the application, the default command in this image is `--help`. If you want to actually run `semantic-release`, run the above command with your set of arguments, or simply `--` if no arguments are needed, like so:

```sh
$ docker run --rm gtramontina/semantic-release:<version> --
```

**Note 2**: You'll need to mount your `git`-based project in the container, as well as the necessary environment variables. The example below mounts the current directory as `/app` in the container and sets it as the working directory (`-w`). It also sets the required `GH_TOKEN` and `NPM_TOKEN` environment variables (because we're using the default verification/publication settings).

```sh
$ docker run --rm \
  -w /app \
  -v $(pwd):/app \
  -e GH_TOKEN=$GH_TOKEN \
  -e NPM_TOKEN=$NPM_TOKEN \
  gtramontina/semantic-release:<version>
```

**Note 3**: If you're running `semantic-release` in Travis, AppVeyor or any other CI environment, remember to forward the relevant environment variables to your container. The following example forwards Travis' variables:

```sh
$ docker run --rm \
  -w /app \
  -v $(pwd):/app \
  -e GH_TOKEN=$GH_TOKEN \
  -e NPM_TOKEN=$NPM_TOKEN \
  -e TRAVIS_COMMIT=$TRAVIS_COMMIT \
  -e TRAVIS_BUILD_NUMBER=$TRAVIS_BUILD_NUMBER \
  -e TRAVIS_BRANCH=$TRAVIS_BRANCH \
  -e TRAVIS_JOB_NUMBER=$TRAVIS_JOB_NUMBER \
  -e TRAVIS_PULL_REQUEST=$TRAVIS_PULL_REQUEST \
  -e TRAVIS_REPO_SLUG=$TRAVIS_REPO_SLUG \
  -e TRAVIS_BUILD_DIR=$TRAVIS_BUILD_DIR \
  gtramontina/semantic-release:<version>
```

At the time of this writing, `semantic-release` was making use of [`env-ci`](https://github.com/pvdlg/env-ci) to detect CI environments. Take a look at the [environment variables it uses for your CI](https://github.com/pvdlg/env-ci/tree/master/lib) so you can forward them to your container.

---

#### _Developing:_

```sh
$ make build    # Builds a new image
$ make test     # Runs/tests the image
$ make push     # Pushes the image up
$ make clean    # Removes any generated artifacts
$ make clobber  # Removes artifacts and generated images
```

---

<p align="right">🐳</p>
