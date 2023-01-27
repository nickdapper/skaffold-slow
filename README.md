# skaffold-slow


This will create 20 example services and build all the binaries
```
make all
```

This will run skaffold using `vdebug` flag.
```
make skaffold
```

Running skaffold v2.1.0 with 7 kubectl contexts. 

Notice the number times `kubectl config view` is called.
