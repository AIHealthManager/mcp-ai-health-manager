import uuid

from mcp.server.fastmcp import FastMCP

dummy_visits = [
    {
        "id": str(uuid.uuid4()),
        "user_id": "11111111-1111-1111-1111-111111111111",
        "visit_date": "2024-12-01",
        "doctor_name": "Dr. Alice Thompson",
        "reason": "Annual physical check-up",
        "diagnosis": "Healthy",
        "notes": "Recommended routine blood test.",
    },
    {
        "id": str(uuid.uuid4()),
        "user_id": "11111111-1111-1111-1111-111111111111",
        "visit_date": "2024-10-15",
        "doctor_name": "Dr. Bob Garcia",
        "reason": "Persistent headache",
        "diagnosis": "Migraine",
        "notes": "Prescribed medication and follow-up in two weeks.",
    },
    {
        "id": str(uuid.uuid4()),
        "user_id": "11111111-1111-1111-1111-111111111111",
        "visit_date": "2024-08-20",
        "doctor_name": "Dr. Clara Zheng",
        "reason": "Chest pain",
        "diagnosis": "Acid reflux",
        "notes": "Advised dietary changes and prescribed antacids.",
    },
    {
        "id": str(uuid.uuid4()),
        "user_id": "11111111-1111-1111-1111-111111111111",
        "visit_date": "2025-01-05",
        "doctor_name": "Dr. Daniel Smith",
        "reason": "Back pain",
        "diagnosis": "Muscle strain",
        "notes": "Recommended physical therapy.",
    },
    {
        "id": str(uuid.uuid4()),
        "user_id": "11111111-1111-1111-1111-111111111111",
        "visit_date": "2025-03-10",
        "doctor_name": "Dr. Emily Nguyen",
        "reason": "Skin rash",
        "diagnosis": "Eczema",
        "notes": "Prescribed topical cream.",
    },
]

mcp = FastMCP("AI Health Manager")


@mcp.tool()
async def select_user_visits(user_id: str) -> list[dict]:
    """
    Fetch all doctor visit records for a specific user from the `doctor_visits` table.

    The `doctor_visits` table stores medical visit history for users. Each record includes:
      - `visit_date`: a string representing the date of the visit
      - `doctor_name`: the name of the doctor the user saw
      - `reason`: the reason for the visit (e.g., symptoms or check-up)
      - `diagnosis`: the doctor's diagnosis or assessment
      - `notes`: any additional information or instructions given
      - `user_id`: foreign key reference to the `users` table
      - Timestamps for record creation and updates

    This function takes a `user_id` (UUID as string) and retrieves all associated visit records.

    Args:
        user_id (str): UUID of the user whose visit history is to be retrieved.

    Returns:
        list[dict]: A list of dicts containing the visit records.
    """
    return dummy_visits


if __name__ == "__main__":
    mcp.run(transport="stdio")
