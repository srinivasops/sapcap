
{{- define "capk.name" -}}
{{ .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end -}}