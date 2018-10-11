# kubeswitch

As homebrew does not provide version switch for previous version (version not installed before). In case you have multiple kubernetes cluster with different version. This could give a little help.

```
# to list version
> kubeswitch
Version available:
1.10.4
1.11.2
1.7.2

# to switch version
# if version not installed before, it would be fetched from google storage
> kubeswitch 1.10.4
```
