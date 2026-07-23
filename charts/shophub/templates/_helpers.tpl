{{- define "shophub.fullname" -}}
shophub
{{- end }}

{{- define "shophub.labels" -}}
app.kubernetes.io/name: shophub
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}
