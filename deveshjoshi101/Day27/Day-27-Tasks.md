### Day 27: Kubernetes Security

**Objective:** Understand and implement Kubernetes security best practices, including Role-Based Access Control (RBAC), Network Policies, container image security, and Pod Security Policies.

---

#### **1. Learn About Kubernetes Security Best Practices**

**Key Areas of Focus:**

- **Role-Based Access Control (RBAC):** Control access to Kubernetes resources based on user roles.
- **Network Policies:** Define rules for pod-to-pod communication.
- **Container Image Security:** Ensure images are free of vulnerabilities.
- **Pod Security Policies:** Enforce security standards for pods.

**Resources:**

- [Kubernetes Security Best Practices](https://kubernetes.io/docs/concepts/security/overview/)
- [Kubernetes RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
- [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
- [Pod Security Policies](https://kubernetes.io/docs/concepts/security/pod-security-policy/)

---

#### **2. Implement Role-Based Access Control (RBAC) in Your Cluster**

**RBAC Components:**

- **Roles:** Define a set of permissions.
- **RoleBindings:** Bind roles to users or groups.
- **ClusterRoles and ClusterRoleBindings:** Define permissions across the entire cluster.

**Example Role YAML:**

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: my-role
  namespace: default
rules:
  - apiGroups: [""]
    resources: ["pods"]
    verbs: ["get", "list", "watch"]
```

**Example RoleBinding YAML:**

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: my-rolebinding
  namespace: default
subjects:
  - kind: User
    name: my-user
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: my-role
  apiGroup: rbac.authorization.k8s.io
```

**Resources:**

- [RBAC Overview](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
- [Creating and Managing RBAC Roles](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#role-based-access-control)

---

#### **3. Use Network Policies to Secure Pod Communication**

**Network Policies:**

- **Purpose:** Control the communication between pods and between pods and services.

**Example Network Policy YAML:**

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: my-network-policy
  namespace: default
spec:
  podSelector:
    matchLabels:
      app: my-app
  ingress:
    - from:
        - podSelector:
            matchLabels:
              app: allowed-app
```

**Resources:**

- [Network Policies Overview](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
- [Network Policy Examples](https://kubernetes.io/docs/concepts/services-networking/network-policies/#examples)

---

#### **4. Scan and Secure Container Images Before Deploying to Kubernetes**

**Container Image Security:**

- **Scanning Tools:** Use tools like Trivy, Clair, or Anchore to scan images for vulnerabilities.
- **Best Practices:** Use minimal base images, regularly update images, and avoid running containers as root.

**Example Scanning Command (Trivy):**

```sh
trivy image my-image:latest
```

**Resources:**

- [Trivy](https://github.com/aquasecurity/trivy)
- [Clair](https://github.com/quay/clair)
- [Anchore](https://anchore.com/)

---

#### **5. Explore and Use Kubernetes Pod Security Policies**

**Pod Security Policies:**

- **Purpose:** Enforce security standards for pods (note: Pod Security Policies are deprecated in Kubernetes 1.21 and are planned for removal in 1.25).

**Example Pod Security Policy YAML:**

```yaml
apiVersion: policy/v1beta1
kind: PodSecurityPolicy
metadata:
  name: my-psp
spec:
  privileged: false
  volumes:
    - "configMap"
    - "emptyDir"
    - "projected"
    - "secret"
    - "downwardAPI"
  allowedCapabilities:
    - "NET_ADMIN"
    - "SYS_TIME"
```

**Resources:**

- [Pod Security Policies](https://kubernetes.io/docs/concepts/security/pod-security-policy/)
- [Pod Security Standards](https://kubernetes.io/docs/concepts/security/pod-security-standards/)

---

### **Documentation**

**Document the Following:**

- **RBAC:**

  - Definitions, YAML examples for Roles and RoleBindings, and use cases.

- **Network Policies:**

  - Definitions, YAML examples, and use cases for controlling pod communication.

- **Container Image Security:**

  - Tools and methods for scanning images and best practices for secure images.

- **Pod Security Policies:**
  - Definitions, YAML examples, and alternatives if using newer Kubernetes versions.

---
