{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "deployer.name" -}}
{{- default .Release.Name .Values.nameOverride -}}
{{- end -}}

{{- define "deployer.fullname" -}}
{{- default .Release.Name .Values.nameOverride -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "deployer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "deployer.labels" -}}
helm.sh/chart: {{ include "deployer.chart" . }}
{{ include "deployer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "deployer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "deployer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Generic resource metadata
*/}}
{{- define "deployer.metadata" -}}
metadata:
  name: {{ include "deployer.name" . }}
  labels:
    {{- include "deployer.labels" . | nindent 4 }}
{{- end -}}
