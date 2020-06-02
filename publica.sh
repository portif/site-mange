#!/usr/bin/bash

# publica.sh
# Este arquivo faz parte do site-mange
#
# Direito autoral (C) 2020 - Jurandy
#
# site-mange é software livre; você pode redistribuí-lo e/ou modificá-lo
# nos termos da Licença Pública Geral GNU, publicada por
# a Free Software Foundation; a versão 2 da licença ou
# (a seu critério) em qualquer versão posterior.
#
# site-mange é distribuído na esperança de que seja útil,
# mas SEM QUALQUER GARANTIA; sem sequer a garantia implícita de
# COMERCIABILIDADE ou ADEQUAÇÃO A UM OBJETIVO ESPECÍFICO. Veja o
# GNU General Public License para mais detalhes.
#
# Você deveria ter recebido uma cópia da Licença Pública Geral GNU
# junto com o site-mange. Caso contrário, consulte <http://www.gnu.org/licenses/>.

configurar_usuario(){
   if ! git config user.name
   then
      echo "Seu nome ainda não está configurado. Informe-o, por gentileza."
      echo -e "Nome completo (Nome e sobrenome): "
      read nome
      git config --global user.name $nome
   fi
   if ! git config user.email
   then
      echo "Seu endereço de e-mail ainda não está configurado. Informe-o, por gentileza."
      echo -e "Endereço de e-mail: "
      read email
      git config --global user.email $email
   fi
   
}

echo "Recebendo atualizações do GitLab (repositório remoto)."
git pull

echo "Verificando a existência de arquivos alterados e adicionando-os ao repositório local."
git add .

echo "Registrando os arquivos alterados, se houver."
git commit -m "$(date)"

echo "Sincronizando registros do repositório local com o repositório remoto."
git push
