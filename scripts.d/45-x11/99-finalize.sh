#!/bin/bash

ffbuild_enabled() {
    [[ $TARGET != linux* ]] && return -1
    return 0
}

ffbuild_dockerlayer() {
    to_df "COPY --from=${SELFLAYER} \$FFBUILD_PREFIX/. \$FFBUILD_PREFIX"
    to_df "COPY --from=${SELFLAYER} \$FFBUILD_PREFIX/share/aclocal/. /usr/share/aclocal"
}

ffbuild_dockerbuild() {
    rm "$FFBUILD_PREFIX"/lib/lib*.so*
}

ffbuild_libs() {
    echo -ldl
}
