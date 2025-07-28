module counter_project::counter;

// use sui::object::{Self, UID};
// use sui::transfer;
// use sui::tx_context::{Self, TxContext};

/// Counter object that can be incremented
public struct Counter has key, store {
    id: UID,
    value: u64,
}

/// Initialize function - runs once when module is published
fun init(ctx: &mut TxContext) {
    let counter = create_counter(ctx);
    // Share the counter so anyone can use it
    transfer::share_object(counter);
}

/// Create a new counter with value 0
fun create_counter(ctx: &mut TxContext): Counter {
    Counter {
        id: object::new(ctx),
        value: 0,
    }
}

/// Get the current counter value
public fun get_value(counter: &Counter): u64 {
    counter.value
}

/// Increment the counter by 1
public fun increment(counter: &mut Counter) {
    counter.value = counter.value + 1;
}

/// Reset counter to 0
public fun reset(counter: &mut Counter) {
    counter.value = 0;
}

/// Test-only function to create counter for unit tests
#[test_only]
public fun create_counter_for_testing(ctx: &mut TxContext): Counter {
    create_counter(ctx)
}
