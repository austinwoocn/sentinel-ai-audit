# Sentinel 系统架构

## 整体架构

```
用户请求 → 网关 → 策略拦截检查
              │
              ├─→ 通过 → 审计记录 → 风险评分
              │                        │
              │            ┌───────────┴───────────┐
              │            │                       │
              │         Risk<70                 Risk>90
              │            │                       │
              │         正常执行                熔断拦截
              │            │                       │
              │         日志归档                告警通知
              └────────────┴───────────────────────┘
                           │
                    合规报告生成
                           │
                    TSA时间戳签名
                           │
                    长期存储/WORM
```

## 模块划分

```
Sentinel/
├── compliance/          # W14: 合规智能
│   ├── rule_engine.py       # DSL规则引擎
│   ├── risk_scorer.py       # 实时风险评分
│   └── shadow_policy.py     # 影子策略
├── federation/          # W13: 联邦化审计
│   ├── zkp_validator.py     # 零知识证明
│   └── cross_org_tracer.py  # 跨组织溯源
├── audit/               # W10: 多模态审计
├── policy/              # W9: 策略拦截
└── replay/              # W12: 自愈恢复
```

## 性能指标

- 单条扫描 <10ms
- 100% 捕获Top 10高危操作
- 误报率 <0.1%
- 并发处理 10万QPS
