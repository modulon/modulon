// !-----------------------------------------------------------------------------------------------
// !`src/io/interrupts/exceptions.rs`
// !
// !Exception handlers for the CPU
// !-----------------------------------------------------------------------------------------------

use system::panic;

#[no_mangle]
pub fn divzero() {
	panic::exception("Divide By Zero");
}

#[no_mangle]
pub fn page_fault() {
	panic::exception("Divide By Zero");
}
