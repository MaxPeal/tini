#####################################
# THIS FILE IS AUTOGENERATED!       #
# Edit ./tpl/travis.yml.ypl instead #
#####################################

language: c

compiler:
- gcc
- clang

env:
  global:
  - secure: "HuC8Hle8eq50yrCCzxKzaaDmtFOIH0dNT6tDHKO3HPT+xG2sQhmY9dJwkY/GIC7cpO+JOWolKTytR0XZrQG7Nj9WU0sO4AxxJsehWLr/ZkHrUTyU3BQ9hHmB/2LEqYNcP7WJlU4pDaOtxviQY5p9nBEGBgGk6Zt9hoJ/sAQeybw="

addons:
  apt:
    packages:
    - build-essential
    - cmake
    - rpm
    - git
    - gdb
    - valgrind
    - python-dev
    - libcap-dev
    - python-pip
    - python-virtualenv
  coverity_scan:
    project:
      name: "krallin/tini"
      description: "A tiny but valid `init` for containers "
    notification_email: thomas@orozco.fr
    build_command_prepend: "cmake .; make clean"
    build_command:   "make"
    branch_pattern: coverity_scan

script: ./ci/run_build.sh

sudo: false

deploy:
  provider: releases
  api_key:
    secure: Yk90ANpSPv1iJy8QDXCPwfaSmEr/WIJ3bzhQ6X8JvZjfrwTosbh0HrUzQyeac3nyvNwj7YJRssolOFc21IBKPpCFTZqYxSkuLPU6ysG4HGHgN6YJhOMm4mG4KKJ6741q3DJendhZpalBhCEi+NcZK/PCSD97Vl4OqRjBUged0fs=
  file:
    - "./dist/tini"
    - "./dist/tini-static"
    - "./dist/tini_@tini_VERSION_MAJOR@.@tini_VERSION_MINOR@.@tini_VERSION_PATCH@.deb"
    - "./dist/tini_@tini_VERSION_MAJOR@.@tini_VERSION_MINOR@.@tini_VERSION_PATCH@.rpm"
  on:
    repo: krallin/tini
    tags: true
    condition: "$CC = gcc"
