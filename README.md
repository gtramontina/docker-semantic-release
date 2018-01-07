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
