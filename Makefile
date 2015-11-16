VERSION=1.0.0
NOMBRE="huayra-block"

N=[0m
G=[01;32m
Y=[01;33m
B=[01;34m

comandos:
	@echo ""
	@echo "${B}Comandos disponibles para ${G}huayra-block${N}"
	@echo ""
	@echo "  ${Y}Para desarrolladores${N}"
	@echo ""
	@echo "    ${G}iniciar${N}         Instala dependencias."
	@echo "    ${G}ejecutar_linux${N}  Prueba la aplicacion sobre Huayra."
	@echo "    ${G}ejecutar_mac${N}    Prueba la aplicacion sobre OSX."
	@echo ""
	@echo "  ${Y}Para distribuir${N}"
	@echo ""
	@echo "    ${G}crear_deb${N}       Empaqueta para huayra."
	@echo "    ${G}version${N}         Incrementa la versión del paquete."
	@echo "    ${G}subir_version${N}   Publica la version nueva."
	@echo ""


iniciar:
	npm install

ejecutar_linux:
	nw src

ejecutar_mac:
	/Applications/nwjs.app/Contents/MacOS/nwjs src


crear_deb:
	dpkg-buildpackage -us -uc

version:
	# patch || minor
	@bumpversion major --current-version ${VERSION} src/package.json Makefile src/index.html --list
	@echo "Es recomendable escribir el comando que genera los tags y sube todo a github:"
	@echo ""
	@echo "make subir_version"

ver_sync: subir_version

subir_version:
	git commit -am 'release ${VERSION}'
	git tag '${VERSION}'
	git push
	git push --all
	git push --tags
