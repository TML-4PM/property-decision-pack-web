# TROY'S INTELLIGENCE PIPELINE
**Serverless AWS Lambda ETL Pipeline**

## 🎯 Architecture

```
Google Drive → Lambda (Sync) → Supabase → Lambda (Process) → Lambda (Dashboard) → S3
     ↓                                                                                ↓
  (Daily 5AM)                                                                   (Public Web)
```

## 📦 Components

### 1. Lambda Functions
- **gdrive-sync** - Syncs conversations from Google Drive to Supabase (5 AM AEDT)
- **intelligence-processor** - Extracts tasks, code, insights (5:30 AM AEDT)
- **dashboard-generator** - Creates HTML dashboard (6 AM AEDT)

### 2. Infrastructure
- EventBridge rules for scheduling
- Secrets Manager for credentials
- S3 bucket for dashboard hosting
- CloudWatch Logs for monitoring

### 3. Data Flow
```
Google Drive (Source) 
  → Supabase (conversations table)
  → Supabase (tasks_master, code_blocks tables)
  → S3 (dashboard HTML)
```

## 🚀 Deployment

### Prerequisites
- AWS CLI configured
- AWS SAM CLI (optional)
- Python 3.11+
- Google Drive service account credentials

### One-Command Deploy
```bash
bash deploy.sh
```

### Manual Deploy
```bash
# Package
pip install -r requirements.txt -t layer/python/
cd layer && zip -r ../layer.zip python/

# Deploy
aws cloudformation deploy \
  --template-file template.yaml \
  --stack-name troy-intelligence-pipeline-v2 \
  --parameter-overrides SupabaseKey=$SUPABASE_KEY \
  --capabilities CAPABILITY_IAM \
  --region ap-southeast-2
```

## 🔧 Configuration

### Google Drive Setup
1. Create service account in Google Cloud Console
2. Enable Google Drive API
3. Share folder with service account email
4. Download JSON credentials
5. Store in Secrets Manager:
```bash
aws secretsmanager put-secret-value \
  --secret-id troy-intelligence-google-drive \
  --secret-string file://credentials.json
```

### Supabase Setup
1. Ensure tables exist:
   - `conversations`
   - `tasks_master`
   - `code_blocks`
2. Service key stored in Secrets Manager automatically

## 📊 Monitoring

### CloudWatch Logs
```bash
# View sync logs
aws logs tail /aws/lambda/troy-intelligence-gdrive-sync --follow

# View processor logs
aws logs tail /aws/lambda/troy-intelligence-processor --follow

# View dashboard logs
aws logs tail /aws/lambda/troy-intelligence-dashboard --follow
```

### Metrics
- Lambda invocations
- Error rates
- Duration
- Supabase query times

## 🧪 Testing

### Manual Trigger
```bash
# Trigger sync
aws lambda invoke \
  --function-name troy-intelligence-gdrive-sync \
  response.json

# View response
cat response.json | jq .
```

### Test Query Supabase
```bash
curl -H "apikey: $SUPABASE_KEY" \
  "https://onhfvnljbbzfzxydkqsw.supabase.co/rest/v1/conversations?limit=10"
```

## 💰 Cost Estimate

Monthly costs (AWS ap-southeast-2):
- Lambda: ~$5 (100K invocations)
- S3: ~$2 (static hosting)
- Secrets Manager: ~$1
- EventBridge: ~$1
- **Total: ~$9/month**

Plus Supabase: $25/month (Pro tier)
**Grand Total: ~$34/month**

## 🔒 Security

- IAM roles with least privilege
- Secrets Manager for credentials
- VPC endpoints (optional)
- CloudWatch audit logging
- S3 bucket policies

## 📈 Scaling

- Lambda auto-scales to 1000 concurrent
- Supabase handles 10K+ requests/sec
- S3/CloudFront for global distribution
- EventBridge supports millions of events

## 🛠️ Maintenance

### Update Functions
```bash
# Update function code
aws lambda update-function-code \
  --function-name troy-intelligence-gdrive-sync \
  --zip-file fileb://function.zip
```

### Update Schedule
```bash
# Modify EventBridge rule
aws events put-rule \
  --name daily-sync \
  --schedule-expression "cron(0 21 * * ? *)"
```

## 📞 Support

- CloudWatch Logs: Full audit trail
- X-Ray: Distributed tracing (optional)
- SNS: Email/Slack alerts (configured)

## ✅ Success Criteria

Pipeline is successful when:
1. Lambda functions show 0 errors
2. Supabase tables populated daily
3. Dashboard updates at 6 AM
4. CloudWatch shows clean executions

---

**Deployed:** November 2025
**Maintainer:** Troy Latter
**Version:** 2.0 (Serverless)
