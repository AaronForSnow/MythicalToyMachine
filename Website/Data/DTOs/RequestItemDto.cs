namespace MythicalToyMachine.Data.DTOs;

    public partial class RequestItemDto
    {
        public int Id { get; set; }

        public int RequestId { get; set; }

        public int KitId { get; set; }

        public int Quantity { get; set; }

        public decimal? RequestPrice { get; set; }
    }
