{{- define "shop.fullname" -}}
shop
{{- end }}

{{- define "shop.labels" -}}
app.kubernetes.io/name: shop
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}
