# Java

# sdkman (Homebrew)
export SDKMAN_DIR="$HOMEBREW_PREFIX/opt/sdkman-cli/libexec"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# GraalVM
export GRAALVM_HOME="$SDKMAN_DIR/candidates/java/21.0.2-graalce"
export PATH="$GRAALVM_HOME/bin:$PATH"
