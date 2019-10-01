{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mongodb-database.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mongodb-database.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mongodb-database.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name for the custom resource mongodb.
*/}}
{{- define "mongodb-database.crds" -}}
{{- template "mongodb-database.fullname" . -}}-crds
{{- end -}}

{{/*
Create the name for the custom resource opsmanagers.
*/}}
{{- define "mongodb-database.opsmanagers" -}}
{{- template "mongodb-database.fullname" . -}}-ops
{{- end -}}

{{/*
Create the name for the ConfigMap of mms project.
*/}}
{{- define "mongodb-database.project" -}}
{{- template "mongodb-database.fullname" . -}}-project
{{- end -}}

{{/*
Create the name for the secret credential of mms project.
*/}}
{{- define "mongodb-database.credentials" -}}
{{- template "mongodb-database.fullname" . -}}-credentials
{{- end -}}
