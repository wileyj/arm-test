FROM rust:bookworm AS build

ARG STACKS_NODE_VERSION="No Version Info"
ARG GIT_BRANCH='No Branch Info'
ARG GIT_COMMIT='No Commit Info'

WORKDIR /src
COPY . .
RUN mkdir /out
RUN rustup toolchain install stable
RUN cargo build --release
RUN cp -R target/release/. /out

FROM debian:bookworm-slim
COPY --from=build /out/rusty-blockparser /bin/
CMD ["stacks-node", "mainnet"]
