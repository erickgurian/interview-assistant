# Event Driven Architecture

Sistemas se comunicam através de eventos.

## Producer

Publica eventos.

## Broker

Responsável por distribuir mensagens.

Exemplos:
- Kafka
- RabbitMQ
- AWS SQS

## Consumer

Consome eventos publicados.

## Benefícios

- Baixo acoplamento
- Escalabilidade
- Resiliência

## Cuidados

- Consistência eventual
- Idempotência