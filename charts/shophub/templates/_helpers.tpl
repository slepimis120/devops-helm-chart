{{- define "shophub.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
A release named after the chart -- which is what ArgoCD does, since it uses the
Application name -- would otherwise come out as "shophub-shophub".
*/}}
{{- define "shophub.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := include "shophub.name" . }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "shophub.frontendName" -}}
{{- printf "%s-frontend" (include "shophub.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "shophub.backendName" -}}
{{- printf "%s-backend" (include "shophub.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "shophub.databaseName" -}}
{{- printf "%s-db" (include "shophub.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "shophub.serviceAccountName" -}}
{{- include "shophub.fullname" . }}
{{- end }}

{{/* Where JWT_SECRET is read from: an existing Secret when given, ours otherwise. */}}
{{- define "shophub.authSecretName" -}}
{{- if .Values.auth.existingSecret }}
{{- .Values.auth.existingSecret }}
{{- else }}
{{- printf "%s-auth" (include "shophub.fullname" .) }}
{{- end }}
{{- end }}

{{- define "shophub.selectorLabels" -}}
app.kubernetes.io/name: {{ include "shophub.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "shophub.labels" -}}
{{ include "shophub.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
