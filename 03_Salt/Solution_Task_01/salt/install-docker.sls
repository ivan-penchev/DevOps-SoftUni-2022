install_docker_engine:
  pkgrepo.managed:
    - humanname: Docker Repo
    - baseurl: https://download.docker.com/linux/centos/$releasever/$basearch/stable
    - gpgkey: https://download.docker.com/linux/centos/gpg
  pkg.installed:
    - pkgs:
      - docker-ce
      - docker-ce-cli
      - containerd.io
  service.running:
    - name: docker
    - enable: True
  pip.installed:
    - name: docker