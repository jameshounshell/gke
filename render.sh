(
    cd $1 && \
    rm -rf charts
    kustomize build --enable-helm --load-restrictor=LoadRestrictionsNone . | \
    kubesplit -cpo $(git rev-parse --show-toplevel)/.render/$(basename $(pwd))
)
