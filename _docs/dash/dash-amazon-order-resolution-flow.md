---
title: Amazon Order Resolution Flow
sidebar: dash
permalink: dash-amazon-order-resolution-flow.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

When a device maker uses the Replenish API to reorder products, it is possible for errors to occur that prevent the Amazon order from being fulfilled. Common order related problems include: an incorrect address, an inaccurate payment instrument, or Amazon being temporarily out-of-stock for the reordered product.

In these cases, Amazon will prompt the customer to resolve the issue and direct them to appropriate resources. As a device maker, it is important to understand the Amazon Order Resolution Flow to accommodate your customers.

* TOC
{:toc}

## Successful Order Flow

The following is an example of a successful flow with no order processing issues:

1.  Device maker replenish API request is received by DRS.
2.  Device maker receives a 200 OK (StandardOrderPlaced) response.
3.  Device maker receives an SNS notification for (OrderPlaced).
4.  Customer receives an email indicating an order was created.
5.  Customer has 24 hours to cancel or modify the order.
6.  Further replenish API calls get 200 OK (OrderInProgress) response until the item has been delivered.

## Amazon Order Resolution Flow

The following are examples of the flow when an error is encountered during order processing:

1.  Device maker replenish API request is received by DRS.
2.  Device maker receives a 200 OK (StandardOrderPlaced) response.
3.  Device maker does not receive an SNS notification for (OrderPlaced).
4.  The customer receives an Amazon Order Resolution email.
5.  A 72-hour timer is started for the customer to resolve the issue.
6.	Further replenish API calls get 200 OK (OrderInProgress) response.

### Scenario 1: The customer does not resolve the issue within 72 hours

1.  Customer receives an order cancelled email.
2.  Device maker receives an SNS notification for (OrderCancelled).
3.  Device maker replenish API calls will now be unblocked and will receive a new 200 OK (StandardOrderPlaced)

### Scenario2: The customer resolves the issue within 72 hours

1.  Customer receives an email indicating an order was created.
2.  Device maker receives an SNS notification for (OrderPlaced).
3.  Customer has 24 hours to cancel an order.
4.  Further replenish API calls get 200 OK (OrderInProgress) response.

{% include links.html %}
