---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  annotations:
    sealedsecrets.bitnami.com/cluster-wide: "true"
  creationTimestamp: null
  name: github-registry-secret
spec:
  encryptedData:
    .dockerconfigjson: AgBvlXsEMF5slBzXw5oK+3OYu4H7F6NYhsdXdB8Y3M3jH9CUopywznR9LmEnU6+LRHzQOQzXsIGuNhjAZIWxfYAQXEcoJ4Y063S0MgJYfCqlPd3xphTZ4Z2732dDLrX3WC0OjcNdCw7tqzrT2za9Sk0nfDhPuV6qqC+ickFRf3nWeL+/hzM1S1MlgXAGe0nD6njBXLr/NhpFyctH327kVo0HH1DOrfnASjAW1zB2IMaAlOCzwA6WUIs4EA10zhIMU0fvOhALVAIbFORG3+FCs0oKAlbTV+TEPBLfMfNl5CcKUt8pTG78j2aB3Ge0Pp5l5ERskCVzDLWEya7JLrJHuj7bnkLW92M5e+Jx9rCrL6PQCEgyh5YuDeZC7YMeXgBEvlNoDjztLHdLNykQo5V/kBuuO38eq7h/HpQrmARC2DCjwCv3pQ2IrtdVsar/vEUh6dU83C2bQ77IdZNcuww3Z7tA99mRrEmNtv+Sv3L/5D3e9IL1Px6GO7+jb5rt+tUdm9pjNUU82S6b6keh3wD4I/dmGj+2fN0hzAYKot+T0ZlTC7FJQ4e/WGpWPLSgHygTtIgfmfGzqZZLxXGKl0/JVsQie9Lcy6094FdF+ZuwdUILhRDdbNwjKVOLU4UBdzDquafc26MnDBcYndRfC0B0S+mUjWuyE7qPdAbKx6g+fQ1RokRn171yrJA+KrVrpDzjgmT9kfK337i5iQ/DSNyl7xfSYw1NH52PYzWlfnsGr74l8IDM0mlBZPcyu3uN1rF6gK/GRWIefVVAkd+LZLUtR7o+3N+qbg0rBbgUjzhtJ//tELElndXzxMAJaiUppr7ax3gw6ENSAspyu7ZaSoOzB57SuVN+dBYoDJ09nZbUWHvOzUlxhAO3k/MnyxfaSmPTRG3uO/vSYt4BwnOE3aaKI40xnY/nnOomtrQZQAQEPleb7gmWYrcPK+wxFMMnruvdoR+1zFXrLBaOD7pRABczkCJZZwX6Ng==
  template:
    metadata:
      annotations:
        sealedsecrets.bitnami.com/cluster-wide: "true"
      creationTimestamp: null
      name: github-registry-secret
    type: kubernetes.io/dockerconfigjson
