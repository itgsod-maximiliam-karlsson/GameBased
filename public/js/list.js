$(document).ready( function () {
    $('#table_id').DataTable(
        {
            paging: false,
            order: [ 1, 'desc' ]
        }
    );
    $('#table_new').DataTable(
        {
            paging: false,
            order: [ 2, 'desc' ]
        }
    );
} );