{{/*
Expand the name of the chart.
*/}}
{{- define "bdjuno.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified Bdjuno name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "bdjuno.fullname" -}}
{{- if .Values.bdjuno.fullnameOverride -}}
{{- .Values.bdjuno.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.bdjuno.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified Hasura name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hasura.fullname" -}}
{{- if .Values.hasura.fullnameOverride -}}
{{- .Values.hasura.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default "hasura" .Values.hasura.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "common.labels" -}}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Bdjuno labels
*/}}
{{- define "bdjuno.labels" -}}
{{ include "common.labels" . }}
{{ include "bdjuno.selectorLabels" . }}
{{- end -}}

{{/*
Bdjuno Selector labels
*/}}
{{- define "bdjuno.selectorLabels" -}}
app.kubernetes.io/name: bdjuno
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Hasura labels
*/}}
{{- define "hasura.labels" -}}
{{ include "common.labels" . }}
{{ include "hasura.selectorLabels" . }}
{{- end -}}

{{/*
Hasura Selector labels
*/}}
{{- define "hasura.selectorLabels" -}}
app.kubernetes.io/name: hasura
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}