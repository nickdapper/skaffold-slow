SERVICES := $(wildcard cmd/service-*)

.PHONY: all
all: clean create-20 $(SERVICES)

.PHONY: $(SERVICES)
$(SERVICES):
	@echo "build $@"
	@$(MAKE) -C $@


.PHONY: skaffold
skaffold:
	skaffold -vdebug build -p dev


# To add another service, also add it to skaffold.yaml top level.
.PHONY: create-20
create-20: clean
	echo "creating 20 services"

	@for n in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20; do \
	 	mkdir -p cmd/service-$$n ; \
	 	cp service-tmpl/Dockerfile cmd/service-$$n ; \
		cp service-tmpl/Makefile cmd/service-$$n ; \
	 	sed "s/{{Number}}/$$n/g" service-tmpl/main.go.tmpl > cmd/service-$$n/main.go ; \
	 	sed "s/{{Number}}/$$n/g" service-tmpl/skaffold.yaml.tmpl > cmd/service-$$n/skaffold.yaml ; \
	done

.PHONY: clean
clean:
	@echo cleaning...
	@rm -rf cmd
