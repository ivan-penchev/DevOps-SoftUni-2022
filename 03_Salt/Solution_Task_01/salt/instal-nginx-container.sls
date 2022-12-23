create_container:
  docker_container.running:
    - image: nginx
    - port_bindings:
            - 80: 80
    - detach: True