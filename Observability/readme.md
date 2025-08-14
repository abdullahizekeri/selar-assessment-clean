**Observability & Ops Plan**
1. Logging

AWS CloudWatch Logs

EKS cluster control plane logs enabled (API, audit, authenticator, scheduler, controller manager).

Application logs collected via Fluent Bit DaemonSet, forwarded to CloudWatch Logs.

Retention policy set to 30 days for dev, 90 days for production.

Local (Minikube/Kind): Use kubectl logs and local Fluent Bit to forward logs to a local Loki instance.

2. Metrics

Prometheus for metrics collection:

Node-level metrics (CPU, memory, disk, network).

Pod-level metrics (resource requests vs. usage, restarts, failures).

Grafana for visualization:

Dashboards for EKS, nodes, pods, ingress traffic.

Alert panels for error rates and resource saturation.

3. Tracing

OpenTelemetry integration for distributed tracing (optional for the demo).

Export traces to AWS X-Ray for end-to-end request path analysis.

4. Alerting

Prometheus Alertmanager integrated with:

Slack channel (Ops alerts).

Email notifications for critical events.

Alerts for:

High pod restarts.

CPU > 85% or memory > 90%.

HTTP 5xx rate > 5% for 5 minutes.

Unreachable endpoints.

5. Incident Mitigation Strategy

Example: High Error Rate on API

Detection: Alert from Prometheus on high 5xx responses.

Investigation:

Check recent deployments (kubectl rollout history).

Review application logs in CloudWatch.

Inspect metrics (CPU/memory) in Grafana.

Immediate Mitigation:

Roll back to last stable Helm release (helm rollback sample-api <REVISION>).

Scale up pods if load-related.

Post-Incident:

Root Cause Analysis (RCA) documented.

Apply fix in a new branch → test in staging → redeploy to prod.

6. Tooling Overview
Layer	Tool(s)
Metrics	Prometheus, AWS CloudWatch Metrics
Visualization	Grafana
Logging	Fluent Bit + CloudWatch Logs, Loki (local)
Tracing	OpenTelemetry, AWS X-Ray
Alerts	Prometheus Alertmanager + Slack/Email