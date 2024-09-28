A program that acts as an intermediary between a user of a computer and the computer hardware
- Operating system goals:
- Execute user programs 
- Convenience 
- Efficiency with hardware 

**Computer System can be divided into 4 parts**
- Hardware
- OS
- Application programs
- User
---
**Computer system basics & important points**

- Concurrent execution of CPU and devices competing for memory cycles
- Each device controller has a local buffer 
- Each device controller type has an operating system device driver to manage it
- Device controller informs CPU that it has finished its operation by causing an interrupt
---
## Interrupts
 
 **Interrupt**  is a request for the processor) to _interrupt_ currently executing code (when permitted), so that the event can be processed in a timely manner. If the request is accepted, the processor will suspend its current activities, save its state and execute a function called an _interrupt handler_ (or an _interrupt service routine_, ISR) to deal with the event.
 
 > Basically transfers control to **Interrupt service routine** or **interrupt handler function**.

> A `trap or an exception` is software generated interrupt caused by user-request or error

First i/o driver initiates i/o ---> process execution starts ---> i/o keeps checking for input/ output complete/ error, if it happens ---> interrupt ---> control to handler or ISR ---> handling and control back to process ---> process execution starts again 
 