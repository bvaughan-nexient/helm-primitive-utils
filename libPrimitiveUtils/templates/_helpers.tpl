
{{/*
libCommonUtils.selector-labels.v1 - Selector labels for all resources.
*/}}
{{- define "libCommonUtils.selector-labels.v1" -}}
{{- $testValueMessage := include "libCommonUtils.default-check-required-value-msg.v1" . -}}
app.kubernetes.io/name: {{ required (printf $testValueMessage "name") .Values.name | quote }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
libCommonUtils.default-check-required-value-msg.v1: Default message when testing for required values in library templates.
*/}}
{{- define "libCommonUtils.default-check-required-value-msg.v1" -}}
{{- "No value found for '%s' in library template" -}}
{{- end -}}

{{/*
libCommonUtils.labels.v1 - Common labels for all resources.
*/}}
{{- define "libCommonUtils.labels.v1" -}}
{{- $testValueMessage := include "libCommonUtils.default-check-required-value-msg" . -}}
app.kubernetes.io/name: {{ required (printf $testValueMessage "name") .Values.name | quote }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}


{{- /*
libCommonUtils.listEnvVars.v1 takes a list of key-value pairs and outputs a environment variable list suitable to be included in a pod definition.
*/}}
{{- define "libCommonUtils.listEnvVars.v1" -}}
{{- range $key, $val := . }}
- name: {{ $key }}
  value: {{ $val }}
{{- end -}}
{{- end -}}

{{- /*
libCommonUtils.listValues.v1: takes a list of key-valuie pairs and outputs $key: $value
*/}}
{{- define "libCommonUtils.listValues.v1" -}}
{{- range $key, $val := . }}
{{ $key }}: {{ $val }} 
{{- end -}}
{{- end -}}