#[test_only]
module counter_project::counter_test;

use counter_project::counter;
use sui::test_scenario;

#[test]
fun test_counter_increment() {
    let admin = @0xABBA;

    let mut scenario = test_scenario::begin(admin);
    {
        // Create counter for testing
        let ctx = test_scenario::ctx(&mut scenario);
        let mut counter = counter::create_counter_for_testing(ctx);

        // Test initial value
        assert!(counter::get_value(&counter) == 0, 0);

        // Test increment
        counter::increment(&mut counter);
        assert!(counter::get_value(&counter) == 1, 1);

        // Test multiple increments
        counter::increment(&mut counter);
        counter::increment(&mut counter);
        assert!(counter::get_value(&counter) == 3, 2);

        // Test reset
        counter::reset(&mut counter);
        assert!(counter::get_value(&counter) == 0, 3);

        // Clean up
        sui::test_utils::destroy(counter);
    };
    test_scenario::end(scenario);
}
