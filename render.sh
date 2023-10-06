(
    cd $1 && \
    kustomize build --enable-helm . | \
    kubesplit -cpo $(git rev-parse --show-toplevel)/.render/$(basename $(pwd))
)
