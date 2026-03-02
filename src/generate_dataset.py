import numpy as np
import pandas as pd

def generate_pricing_ab_dataset(n=80000, seed=42):
    """
    Generate synthetic e-commerce A/B pricing dataset.
    """

    np.random.seed(seed)

    data = pd.DataFrame({
        "user_id": range(1, n + 1),
        "group": np.random.choice(["control", "treatment"], n),
        "device_type": np.random.choice(["mobile", "desktop"], n, p=[0.65, 0.35]),
        "region": np.random.choice(["North", "South", "West", "East"], n),
        "session_date": pd.date_range(start="2024-01-01", periods=n, freq="min")
    })

    control_mask = data["group"] == "control"
    treatment_mask = data["group"] == "treatment"

    data["purchased"] = 0

    data.loc[control_mask, "purchased"] = np.random.binomial(1, 0.18, control_mask.sum())
    data.loc[treatment_mask, "purchased"] = np.random.binomial(1, 0.20, treatment_mask.sum())

    data["order_value"] = 0.0

    data.loc[control_mask & (data["purchased"] == 1), "order_value"] = \
        np.random.normal(1200, 200, (control_mask & (data["purchased"] == 1)).sum())

    data.loc[treatment_mask & (data["purchased"] == 1), "order_value"] = \
        np.random.normal(1140, 200, (treatment_mask & (data["purchased"] == 1)).sum())

    data["order_value"] = data["order_value"].clip(lower=0)

    return data


if __name__ == "__main__":
    dataset = generate_pricing_ab_dataset()
    dataset.to_csv("pricing_ab_test_sample.csv", index=False)
    print("Dataset generated successfully.")
