# pi-docker

A containerised version of the [pi coding agent](https://pi.dev/).

Designed to run as Rootless container with Podman.

## Why?

Pi runs in full YOLO mode and assumes you know what you're doing.

Running the agent in a container mitigates some of the associated risks.

However, this contains no further railguards such as a network sandbox. It's up to you to implement!

## Container images

Multiple container images can be built from this repository; all using a Debian Trixie base:

- `pi-agent`: A container with just the vanilla pi agent.
- `python-agent`: A container with Python development tooling, including `uv`.
- `go-agent`: A container with Golang development tooling.

### How to build

Run `docker compose build` to build all images. You can change the pi agent version in `.env`.

### How to run

Examples are provided in the Docker Compose file. The containers use a named volume for the persistent pi agent configuration; and a bind-mounted `projects` folder to share data from the host.

To run the Golang agent:

```sh
docker compose run --rm go-agent
```
