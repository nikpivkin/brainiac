package lib.kubernetes.CB_K8S_065

test_admission_control_plugin_always_pull_image_is_set {
            result := passed with input as{
                "apiVersion": "v1",
                "kind": "Pod",
                "metadata": {
                    "creationTimestamp": null,
                    "labels": {
                    "component": "kube-apiserver",
                    "tier": "control-plane"
                    },
                    "name": "kubelet",
                    "namespace": "kube-system"
                },
                "spec": {
                    "containers": [
                    {
                        "command": [
                        "kube-apiserver",
                        "--authorization-mode=Node",
						"--enable-admission-plugins=AlwaysPullImages"
                        ],
                        "image": "gcr.io/google_containers/kubelet-amd64:v1.6.0",
                        "name": "gcr"
                    }
                    ]
                }
            }

	count(result) == 1
}

test_admission_control_plugin_always_pull_image_is_not_set {
            result := failed with input as{
                "apiVersion": "v1",
                "kind": "Pod",
                "metadata": {
                    "creationTimestamp": null,
                    "labels": {
                    "component": "kube-apiserver",
                    "tier": "control-plane"
                    },
                    "name": "kubelet",
                    "namespace": "kube-system"
                },
                "spec": {
                    "containers": [
                    {
                        "command": [
                        "kube-apiserver",
                        "--authorization-mode=AlwaysAllow",
						"--enable-admission-plugins=AlwaysAdmit"
                        ],
                        "image": "gcr.io/google_containers/kubelet-amd64:v1.6.0",
                        "name": "gcr"
                    }
                    ]
                }
            }

	count(result) == 1
}
