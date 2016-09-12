# Validate SAML metadata

## Build

type

	make

to build XML catalog files.

## Run

type

	XML_CATALOG_FILES="./xcatalog/saml-metadata.xml" xmllint --schema schema.xsd --noout test/md.xml 

or use the script

	./validate-metadata.sh test/md.xml

