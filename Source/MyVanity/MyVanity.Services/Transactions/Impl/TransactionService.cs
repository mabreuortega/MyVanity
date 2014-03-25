namespace MyVanity.Services.Transactions
{
    class TransactionService : ITransactionService
    {
        public TransactionState State { get; private set; }

        public TransactionService()
        {
            State = TransactionState.Commit;
        }

        public void Rollback()
        {
            State = TransactionState.Rollback;
        }
        public void Commit()
        {
            State = TransactionState.Commit;
        }
    }
}