---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  annotations:
    sealedsecrets.bitnami.com/cluster-wide: "true"
  creationTimestamp: null
  name: github-registry-secret
  namespace: apps
spec:
  encryptedData:
    .dockerconfigjson: AgBoCBA1uy03zKI3CTN6SnibLefpMRvlrAoU45HWOha15WO7XZmkTr+NIDrkNPRreqDXzMcvH91L/9dzvT+JkSqxq8RppV0tGnUvP6e7c5brFC60mMHPy7TFYqzNVN1vrW4GOlsCpHWC5LH56GjUNn4GhF73q42UJLTyaIWfYwxipURu8gfI6e7dQsWwYfOMtEHo7Vf9Eo4Jja8DD4FbmzVFd56j0gXcNuHyOjIS05/oNeVxcrFG/QivVX4dmcDs/QYjRLimgiAt2v4YrhNov5WlyBoH/duc1yhLwifS6o1v4KanuQ23OhoWKQEz9uxSPez+Yx4tlgDSnxv/lhI/GIYh4ViyPp/oulquzxwVWeSllf5MH/2WOYHmESh9qwKf9CKeEWZ7lvz21Gn/DbBZZCE7UgD1PRAMaynXqd38LYH3kcBVKrkM964e6P6LUMPzRSDk5ciDXOcYlVm5yREk3yyYrUkmB0EIfGy4YPzRGP8wZnWkWpY3IPCic1nNKyOJoMWEuYkUAaHz2rZRhyr+EHPdkGiC2p+3fnXBjxpFK4qfMg6m/f1okXhTNpw5UVOtFYvLxiGcm71ipShtrZv+CDyVONeBnc8oW7gRRi8heJ+ptcdMTwBvskGWszfqKy/1EQ7+koQ4LlBJ5fn/qqopNj3JMueDUrkKlyBqmLh2XNjP0FvoMbsEt+LP0J+IoLNQqJ8KAf52cjGpXqty+LWA20A0estPLXL3tl2H1xDeD/JCM58w1fniU/sPXSkdxazfVfrCrrVXH6Z8jBy3jOlfAjaGU+8lLn9yyf7jF+MDMDkfUiGvEDviddmMzaVfFGXCE9TPel9i/H7ht5oUADGxAMLvoyFpdf9j3VTtwwhfihCoYmlmv1hI90vAVUqpl2goMCUwOFxTiaP0zqQFyHums5trh539AIkenfqd7YiE3IwGNB2bK1fWGOwMYa7XJdtfDU0Y1SalgW3haLjY6Nr1TGERxLRlhQ==
  template:
    metadata:
      annotations:
        sealedsecrets.bitnami.com/cluster-wide: "true"
      creationTimestamp: null
      name: github-registry-secret
      namespace: apps
    type: kubernetes.io/dockerconfigjson
