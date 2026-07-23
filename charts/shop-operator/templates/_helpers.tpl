{{- define "shop-operator.fullname" -}}
shop-operator
{{- end }}

{{- define "shop-operator.labels" -}}
app.kubernetes.io/name: shop-operator
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}
