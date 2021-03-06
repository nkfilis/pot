#!/bin/sh

# system utilities stubs

# UUT
. ../share/pot/add-fscomp.sh

# common stubs
. common-stub.sh

_zfs_dataset_valid()
{
	__monitor ZDVALID "$@"
	if [ "$1" = "zpot/fscomp/test-fscomp" ]; then
		return 0 # true
	fi
	if [ "$1" = "zroot/test-fscomp" ]; then
		return 0 # true
	fi
	return 1 # false
}

# app specific stubs
add-fscomp-help()
{
	__monitor HELP "$@"
	return 0 # true
}


_fscomp_validation()
{
	__monitor FSVALID "$@"
}

_mountpoint_validation()
{
	__monitor MPVALID "$@"
}

_add_f_to_p()
{
	__monitor ADDF2P "$@"
}

test_pot_add_fscomp_001()
{
	pot-add-fscomp
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"

	setUp
	pot-add-fscomp -vb
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "0" "$ERROR_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"

	setUp
	pot-add-fscomp -b bb
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "0" "$ERROR_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"

	setUp
	pot-add-fscomp -h
	assertEquals "Exit rc" "0" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "0" "$ERROR_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"
}

test_pot_add_fscomp_002()
{
	pot-add-fscomp -p test-pot
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"

	setUp
	pot-add-fscomp -f test-fscomp
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"

	setUp
	pot-add-fscomp -m test-mnt
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"

	setUp
	pot-add-fscomp -p test-pot -f test-fscomp
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"

	setUp
	pot-add-fscomp -m test-mnt -f test-fscomp
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"

	setUp
	pot-add-fscomp -m test-mnt -p test-pot
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"
}

test_pot_add_fscomp_003()
{
	pot-add-fscomp -p test-no-pot -f test-no-fscomp -m /test-no-mnt
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "1" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"
}

test_pot_add_fscomp_004()
{
	pot-add-fscomp -p test-no-pot -f test-fscomp -m /test-no-mnt
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "1" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "1" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"
}

test_pot_add_fscomp_005()
{
	pot-add-fscomp -p test-no-pot -f zroot/test-no-fscomp -m /test-no-mnt -e
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "1" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"
}

test_pot_add_fscomp_006()
{
	pot-add-fscomp -p test-no-pot -f zroot/test-fscomp -m /test-no-mnt -e
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "1" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "1" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"
}

test_pot_add_fscomp_007()
{
	pot-add-fscomp -p test-no-pot -f zroot/test-fscomp -m /test-no-mnt -e
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "1" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "1" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"
}

test_pot_add_fscomp_008()
{
	pot-add-fscomp -p test-pot -f zroot/test-fscomp -m test-no-mnt
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "0" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"
}

test_pot_add_fscomp_009()
{
	pot-add-fscomp -p test-pot -f zroot/test-fscomp -m /
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "0" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"
}

test_pot_add_fscomp_010()
{
	pot-add-fscomp -p test-pot -f zroot/test-fscomp -m /test-mnt -e -w
	assertEquals "Exit rc" "1" "$?"
	assertEquals "Help calls" "1" "$HELP_CALLS"
	assertEquals "Error calls" "1" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "0" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "0" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "0" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "0" "$ADDF2P_CALLS"
	assertEquals "_mountpoint_validation calls" "0" "$MPVALID_CALLS"
}

test_pot_add_fscomp_020()
{
	pot-add-fscomp -p test-pot -f test-fscomp -m /test-mnt
	assertEquals "Exit rc" "0" "$?"
	assertEquals "Help calls" "0" "$HELP_CALLS"
	assertEquals "Error calls" "0" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "1" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "1" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "1" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "1" "$ADDF2P_CALLS"
	assertEquals "_add_f_to_p arg" "test-fscomp" "$ADDF2P_CALL1_ARG1"
	assertEquals "_add_f_to_p arg" "test-pot" "$ADDF2P_CALL1_ARG2"
	assertEquals "_add_f_to_p arg" "/test-mnt" "$ADDF2P_CALL1_ARG3"
	assertEquals "_add_f_to_p arg" "NO" "$ADDF2P_CALL1_ARG4"
	assertEquals "_add_f_to_p arg" "" "$ADDF2P_CALL1_ARG5"
	assertEquals "_mountpoint_validation calls" "1" "$MPVALID_CALLS"

	setUp
	pot-add-fscomp -p test-pot -f zroot/test-fscomp -m /test-mnt -e
	assertEquals "Exit rc" "0" "$?"
	assertEquals "Help calls" "0" "$HELP_CALLS"
	assertEquals "Error calls" "0" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "1" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "1" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "1" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "1" "$ADDF2P_CALLS"
	assertEquals "_add_f_to_p arg" "zroot/test-fscomp" "$ADDF2P_CALL1_ARG1"
	assertEquals "_add_f_to_p arg" "test-pot" "$ADDF2P_CALL1_ARG2"
	assertEquals "_add_f_to_p arg" "/test-mnt" "$ADDF2P_CALL1_ARG3"
	assertEquals "_add_f_to_p arg" "external" "$ADDF2P_CALL1_ARG4"
	assertEquals "_add_f_to_p arg" "" "$ADDF2P_CALL1_ARG5"
	assertEquals "_mountpoint_validation calls" "1" "$MPVALID_CALLS"
}

test_pot_add_fscomp_021()
{
	pot-add-fscomp -p test-pot -f test-fscomp -m /test-mnt -r
	assertEquals "Exit rc" "0" "$?"
	assertEquals "Help calls" "0" "$HELP_CALLS"
	assertEquals "Error calls" "0" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "1" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "1" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "1" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "1" "$ADDF2P_CALLS"
	assertEquals "_add_f_to_p arg" "test-fscomp" "$ADDF2P_CALL1_ARG1"
	assertEquals "_add_f_to_p arg" "test-pot" "$ADDF2P_CALL1_ARG2"
	assertEquals "_add_f_to_p arg" "/test-mnt" "$ADDF2P_CALL1_ARG3"
	assertEquals "_add_f_to_p arg" "NO" "$ADDF2P_CALL1_ARG4"
	assertEquals "_add_f_to_p arg" "ro" "$ADDF2P_CALL1_ARG5"
	assertEquals "_mountpoint_validation calls" "1" "$MPVALID_CALLS"

	setUp
	pot-add-fscomp -p test-pot -f zroot/test-fscomp -m /test-mnt -e -r
	assertEquals "Exit rc" "0" "$?"
	assertEquals "Help calls" "0" "$HELP_CALLS"
	assertEquals "Error calls" "0" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "1" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "1" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "1" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "1" "$ADDF2P_CALLS"
	assertEquals "_add_f_to_p arg" "zroot/test-fscomp" "$ADDF2P_CALL1_ARG1"
	assertEquals "_add_f_to_p arg" "test-pot" "$ADDF2P_CALL1_ARG2"
	assertEquals "_add_f_to_p arg" "/test-mnt" "$ADDF2P_CALL1_ARG3"
	assertEquals "_add_f_to_p arg" "external" "$ADDF2P_CALL1_ARG4"
	assertEquals "_add_f_to_p arg" "ro" "$ADDF2P_CALL1_ARG5"
	assertEquals "_mountpoint_validation calls" "1" "$MPVALID_CALLS"

	setUp
	pot-add-fscomp -p test-pot -f test-fscomp -m /test-mnt -w
	assertEquals "Exit rc" "0" "$?"
	assertEquals "Help calls" "0" "$HELP_CALLS"
	assertEquals "Error calls" "0" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "1" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "1" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "1" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "1" "$ADDF2P_CALLS"
	assertEquals "_add_f_to_p arg" "test-fscomp" "$ADDF2P_CALL1_ARG1"
	assertEquals "_add_f_to_p arg" "test-pot" "$ADDF2P_CALL1_ARG2"
	assertEquals "_add_f_to_p arg" "/test-mnt" "$ADDF2P_CALL1_ARG3"
	assertEquals "_add_f_to_p arg" "NO" "$ADDF2P_CALL1_ARG4"
	assertEquals "_add_f_to_p arg" "zfs-remount" "$ADDF2P_CALL1_ARG5"
	assertEquals "_mountpoint_validation calls" "1" "$MPVALID_CALLS"

	setUp
	pot-add-fscomp -p test-pot -f test-fscomp -m /test-mnt -w -r
	assertEquals "Exit rc" "0" "$?"
	assertEquals "Help calls" "0" "$HELP_CALLS"
	assertEquals "Error calls" "0" "$ERROR_CALLS"
	assertEquals "_zfs_dataset_valid calls" "1" "$ZDVALID_CALLS"
	assertEquals "_is_pot calls" "1" "$ISPOT_CALLS"
	assertEquals "_is_uid0 calls" "1" "$ISUID0_CALLS"
	assertEquals "_add_f_to_p calls" "1" "$ADDF2P_CALLS"
	assertEquals "_add_f_to_p arg" "test-fscomp" "$ADDF2P_CALL1_ARG1"
	assertEquals "_add_f_to_p arg" "test-pot" "$ADDF2P_CALL1_ARG2"
	assertEquals "_add_f_to_p arg" "/test-mnt" "$ADDF2P_CALL1_ARG3"
	assertEquals "_add_f_to_p arg" "NO" "$ADDF2P_CALL1_ARG4"
	assertEquals "_add_f_to_p arg" "ro" "$ADDF2P_CALL1_ARG5"
	assertEquals "_mountpoint_validation calls" "1" "$MPVALID_CALLS"
}

setUp()
{
	common_setUp
	ZDVALID_CALLS=0
	HELP_CALLS=0
	ADDF2P_CALLS=0
	MPVALID_CALLS=0
	FSVALID_CALLS=0

	POT_FS_ROOT=/tmp
	POT_ZFS_ROOT=zpot
}

. shunit/shunit2
