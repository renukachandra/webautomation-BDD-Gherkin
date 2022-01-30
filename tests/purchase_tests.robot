*** Settings ***
Resource          ../resources.robot
Resource          ../pages/home_page.robot
Resource          ../pages/cart_page.robot
Resource          ../pages/product_page.robot
Resource          ../steps/steps.robot
Test Setup        Open Main Page Using Chrome Browser
Test Teardown     Close Browser

*** Variables ***
${item1_name}  Sony vaio i5
${item2_name}  Dell i7 8gb

*** Test Cases ***
Validate successful single item addition in cart
    GIVEN Home Page Opened
    WHEN Open item description  ${item1_name}
    AND Add item to cart
    THEN Validate item in cart  ${item1_name}

Validate successful deletion of item from cart
    GIVEN Home Page Opened
    WHEN Open item description  ${item1_name}
    AND Add item to cart
    AND Delete item from cart   ${item1_name}
    THEN Validate item deleted from cart  ${item1_name}

Validate successful deletion of item from cart when multiple items present
    GIVEN Home Page Opened
    WHEN Open item description  ${item1_name}
    AND Add item to cart
    AND Open item description  ${item2_name}
    AND Add item to cart
    AND Delete item from cart   ${item2_name}
    THEN Validate item deleted from cart  ${item2_name}

Validate total price shown in cart and on order details form
    GIVEN Home Page Opened
    WHEN one item added to cart successfully  ${item1_name}
    THEN Validate price in cart and payment form

Validate successful order
    GIVEN Home Page Opened
    WHEN one item added to cart successfully  ${item1_name}
    AND Input order details in form and submit
    THEN Validate the success message

Validate price in order details
    GIVEN Home Page Opened
    WHEN one item added to cart successfully  ${item1_name}
    AND Input order details in form and submit
    THEN Validate price in success message