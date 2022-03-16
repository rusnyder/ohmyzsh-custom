# Abort if kubectl isn't installed
if ! hash kubectl &>/dev/null; then
  log_warn "Kubectl not installed - skipping KUBECONFIG setup"
  return
fi

# Load all available kubeconfigs
KUBECONFIG="$HOME/.kube/config:$HOME/.kube/mk/minikube:$HOME/.kube/eks/blue:$HOME/.kube/eks/preprod:$HOME/.kube/eks/demo:$HOME/.kube/eks/prod"
for f in "$HOME/.kube/"*.kubeconfig; do
  KUBECONFIG="$KUBECONFIG:$f"
done
export KUBECONFIG

# Add zsh completion
source <(kubectl completion zsh)

# Aliases
alias k='kubectl'
alias kc='kubectl config'
alias kcc='kubectl config get-contexts'
alias kcu='kubectl config use-context'
