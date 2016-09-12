all: saml-2.0-os xcatalog/saml-metadata.xml

saml-2.0-os:
	mkdir -p saml-2.0-os
	wget http://docs.oasis-open.org/security/saml/v2.0/saml-2.0-os.zip
	unzip -d saml-2.0-os saml-2.0-os.zip *.xsd

xcatalog/saml-metadata.xml: xsd/xml.xsd xsd/xenc-schema.xsd xsd/xmldsig-core-schema.xsd
	mkdir -p xcatalog
	xmlcatalog --noout --create	\
	--add uri http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd	 ../xsd/xmldsig-core-schema.xsd	 \
	--add uri http://www.w3.org/TR/2002/REC-xmlenc-core-20021210/xenc-schema.xsd	 ../xsd/xenc-schema.xsd	 \
	--add uri http://www.w3.org/2001/xml.xsd ../xsd/xml.xsd	\
	xcatalog/saml-metadata.xml

xsd/xml.xsd:
	mkdir -p xsd
	wget -Oxsd/xml.xsd http://www.w3.org/2001/xml.xsd

xsd/xenc-schema.xsd:
	mkdir -p xsd
	wget -Oxsd/xenc-schema.xsd http://www.w3.org/TR/2002/REC-xmlenc-core-20021210/xenc-schema.xsd

xsd/xmldsig-core-schema.xsd:
	mkdir -p xsd
	wget -Oxsd/xmldsig-core-schema.xsd http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd

xsd/ws-federation.xsd:
	mkdir -p xsd
	wget -Oxsd/ws-federation.xsd http://docs.oasis-open.org/wsfed/federation/v1.2/os/ws-federation.xsd

xsd/ws-authorization.xsd:
	mkdir -p xsd
	wget -Oxsd/ws-authorization.xsd http://schemas.xmlsoap.org/ws/2006/12/authorization/ws-authorization.xsd

clean:
	rm xcatalog/saml-metadata.xml
