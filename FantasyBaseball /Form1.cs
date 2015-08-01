using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace FantasyBaseball
{

    public partial class Form1 : Form
    {
        SqlConnection connection1 = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\db__with_extra_field.mdf;Integrated Security=True;User Instance=True");
        SqlConnection connection2 = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\db__with_extra_field.mdf;Integrated Security=True;User Instance=True");
        string Choice;
        string team;
           UInt16 ptr; //Stores the location of which row you're working with
             enum View { All, Available, Roster };
        enum Roster { Add, Remove };
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'db__with_extra_fieldDataSet.Players' table. You can move, or remove it, as needed.
            this.playersTableAdapter.Fill(this.db__with_extra_fieldDataSet.Players);

        }
       
        private void btnQuickPick_Click(object sender, EventArgs e)
        {

        }

        private void btnPlayBook_Click(object sender, EventArgs e)
        {

        }

        private void cmboSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmboSortBy.SelectedText = Choice;
            if (cmboSortBy.SelectedIndex >= 0)
            {
                cmboSortBy.SelectedIndex = -1;
                btnAddtoRoster.Enabled = true;
                button1.Enabled = false;
                Display(cmboSortBy.SelectedItem.ToString(), View.All);
                dataGrid.Focus();
            }
        }
        private void cmboMyTeams_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmboMyTeams.SelectedText = team;
            if (cmboMyTeams.SelectedIndex >= 0)
            {
                cmboMyTeams.SelectedIndex = -1;
                btnAddtoRoster.Enabled = true;
                button1.Enabled = false;
                Display(cmboMyTeams.SelectedItem.ToString(), View.Avai);
                dataGrid.Focus();
            }
        }
        // Position buttons
        private void btnLF_Click(object sender, EventArgs e)
        {

        }

        private void btnCF_Click(object sender, EventArgs e)
        {

        }

        private void btnRF_Click(object sender, EventArgs e)
        {

        }

        private void btn3B_Click(object sender, EventArgs e)
        {

        }

        private void btnSS_Click(object sender, EventArgs e)
        {

        }

        private void btn2B_Click(object sender, EventArgs e)
        {

        }

        private void btn1B_Click(object sender, EventArgs e)
        {

        }

        private void btnPitch_Click(object sender, EventArgs e)
        {

        }

        private void btnCatch_Click(object sender, EventArgs e)
        {

        }
        //Position Lables
        private void labLF_Click(object sender, EventArgs e)
        {

        }

        private void labCF_Click(object sender, EventArgs e)
        {

        }

        private void labRF_Click(object sender, EventArgs e)
        {

        }

        private void lab3B_Click(object sender, EventArgs e)
        {

        }

        private void labSS_Click(object sender, EventArgs e)
        {

        }

        private void lab2B_Click(object sender, EventArgs e)
        {

        }

        private void lab1B_Click(object sender, EventArgs e)
        {

        }

        private void labPitch_Click(object sender, EventArgs e)
        {

        }

        private void labCatch_Click(object sender, EventArgs e)
        {

        }
        //Database Grid
        private void dataGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnAddtoRoster_Click(object sender, EventArgs e)
        {

        }

        private void btnSeeAllPlayers_Click(object sender, EventArgs e)
        {

        }

        private void checkSeeAvail_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
        
        }
 
        
             
        private void Display()
        {
            Display(String.Empty, View.All);
        }
        private void Display(View view)
        {
            Display(String.Empty, view);
        }
        private void Display(String filter, View view)
        {
            ClearPlayersGrid();
            try
            {
                connection1.Open();
                connection2.Open();
                SqlCommand GetPlayers = new SqlCommand(); //Will store specific query depending on what option is selected (see switch statement below)
                SqlCommand GetPositions; //Will be used to get the positions
                SqlDataReader PlayerStats; //Executes the query above, all data is stored in this SqlDataReader
                SqlDataReader PlayerPositions;
                switch (view)
                {
                    case View.All:
                        switch (filter)
                        {
                            case "Players":
                                GetPlayers = new SqlCommand("SELECT * FROM Players ORDER BY Rank;", connection1);
                                break;
                            case "Starting Pitchers":
                                GetPlayers = new SqlCommand("SELECT * FROM Players WHERE PlayerName IN (SELECT PlayerName FROM Positions WHERE Position='SP') ORDER BY Rank;", connection1);
                                break;
                            case "Relief Pitchers":
                                GetPlayers = new SqlCommand("SELECT * FROM Players WHERE PlayerName IN (SELECT PlayerName FROM Positions WHERE Position='RP') ORDER BY Rank;", connection1);
                                break;
                            case "Catchers":
                                GetPlayers = new SqlCommand("SELECT * FROM Players WHERE PlayerName IN (SELECT PlayerName FROM Positions WHERE Position='C') ORDER BY Rank;", connection1);
                                break;
                            default:
                                GetPlayers = new SqlCommand("SELECT * FROM Players ORDER BY Rank;", connection1);
                                break;
                        }
                        break;
                    case View.Available:
                        switch (filter)
                        {
                            case "Players":
                                GetPlayers = new SqlCommand("SELECT * FROM Players WHERE Picked=0 ORDER BY Rank;", connection1);
                                break;
                            case "Starting Pitchers":
                                GetPlayers = new SqlCommand("SELECT * FROM Players WHERE Picked=0 AND PlayerName IN (SELECT PlayerName FROM Positions WHERE Position='SP') ORDER BY Rank;", connection1);
                                break;
                            case "Relief Pitchers":
                                GetPlayers = new SqlCommand("SELECT * FROM Players WHERE Picked=0 AND PlayerName IN (SELECT PlayerName FROM Positions WHERE Position='RP') ORDER BY Rank;", connection1);
                                break;
                            case "Catchers":
                                GetPlayers = new SqlCommand("SELECT * FROM Players WHERE Picked=0 AND PlayerName IN (SELECT PlayerName FROM Positions WHERE Position='C') ORDER BY Rank;", connection1);
                                break;
                            default:
                                GetPlayers = new SqlCommand("SELECT * FROM Players WHERE Picked=0 ORDER BY Rank;", connection1);
                                break;
                        }
                        break;
                    case View.Roster:
                        GetPlayers = new SqlCommand("SELECT * FROM Players WHERE Picked=1 ORDER BY Rank;", connection1);
                        break;
                    default:
                        GetPlayers = new SqlCommand("SELECT * FROM Players ORDER BY Rank;", connection1);
                        break;
                }

                PlayerStats = GetPlayers.ExecuteReader();
                while (PlayerStats.Read()) //If there is data left in SqlDataReader, do the following
                {
                    /* SQL Server specification: escape a single quote by adding an extra single quote to the front of it (i.e. O'Brian => O''Brian, NOTE: NOT A DOUBLE QUOTE)
                     * Query gets all player positions, done on connection2
                     */
                    GetPositions = new SqlCommand("SELECT * FROM Positions WHERE Positions.PlayerName=\'" + PlayerStats[2].ToString().Replace("\'", "\'\'") + "';", connection2);
                    ptr = (UInt16)dataGrid.Rows.Add(); //Specifies which row you're working on
                    dataGrid.Rows[ptr].Cells[0].Value = PlayerStats[0]; //Add Rank to the row
                    dataGrid.Rows[ptr].Cells[1].Value = PlayerStats[1]; //Add ADP to the row
                    dataGrid.Rows[ptr].Cells[2].Value = PlayerStats[2]; //Add PlayerName to the row
                    //This portion adds the player position(s) to the row
                    using (PlayerPositions = GetPositions.ExecuteReader())
                    {
                        String position = String.Empty; //This will store the actual position(s) of the player
                        while (PlayerPositions.Read())
                        {
                            /*  This is done for formatting purposes to make the output look cleaner */
                            if (position == String.Empty)
                                position += PlayerPositions[1];
                            else
                                position += ", " + PlayerPositions[1];
                        }
                        dataGrid.Rows[ptr].Cells[3].Value = position; //Add Position(s) to the row
                    }
                    dataGrid.Rows[ptr].Cells[4].Value = PlayerStats[3]; //Add Team to the row
                    dataGrid.Rows[ptr].Cells[5].Value = PlayerStats[4]; //Add Auction to the row
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Exception: " + ex.Message);
            }
            finally
            {
                //Always close the connection when done
                connection1.Close();
                connection2.Close();
            }

            #region Execute Scalar Demo (Return single value from db)
            /* See http://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlcommand_methods.aspx for SqlCommand methods
             * Executes the query, and returns the first column of the first row in the result set returned by the query. Additional columns or rows are ignored
             * i.e. Returns a value from a single cell rather than a row
             */
            //try
            //{
            //    connection1.Open();
            //    String x = new SqlCommand("SELECT PlayerName FROM Players WHERE Rank=2", connection1).ExecuteScalar().ToString();
            //    connection1.Close();
            //}
            //catch(Exception ex){ }
            #endregion
        }
        private void ClearPlayersGrid()
        {
            dataGrid.RowCount = 0;
        }
        //private void ViewRosterButton_Click(object sender, EventArgs e)
        //{
        //    ViewAllComboBox.SelectedIndex = -1;
        //    ViewAvailableComboBox.SelectedIndex = -1;
        //    AddToRosterButton.Enabled = false;
        //    RemoveFromRosterButton.Enabled = true;
        //    Display(View.Roster);
        //}
        //private void AddToRosterButton_Click(object sender, EventArgs e)
        //{
        //    String PlayerName = dataGrid.CurrentRow.Cells[2].Value.ToString();
        //    dataGrid.Rows.Remove(dataGrid.CurrentRow);
        //    UpdateRoster(PlayerName, Roster.Add);
        //}
        //private void RemoveFromRosterButton_Click(object sender, EventArgs e)
        //{
        //    String PlayerName = dataGrid.CurrentRow.Cells[2].Value.ToString();
        //    dataGrid.Rows.Remove(dataGrid.CurrentRow);
        //    UpdateRoster(PlayerName, Roster.Remove);
        //}
        //private void UpdateRoster(String playerName, Roster roster)
        //{
        //    try
        //    {
        //        connection1.Open();
        //        SqlTransaction Transaction = connection1.BeginTransaction();
        //        SqlCommand UpdatePlayer = new SqlCommand();
        //        switch (roster)
        //        {
        //            case Roster.Add:
        //                UpdatePlayer = new SqlCommand("UPDATE Players SET Picked=1 WHERE PlayerName=\'" + playerName.Replace("\'", "\'\'") + "\';", connection1, Transaction);
        //                UpdateInternalRoster(playerName, Roster.Add);
        //                break;
        //            case Roster.Remove:
        //                UpdatePlayer = new SqlCommand("UPDATE Players SET Picked=0 WHERE PlayerName=\'" + playerName.Replace("\'", "\'\'") + "\';", connection1, Transaction);
        //                UpdateInternalRoster(playerName, Roster.Remove);
        //                break;
        //            default:
        //                throw new Exception("Invalid option. Player must be either added or removed from the roster.");
        //        }
        //        Object EffectedRows = UpdatePlayer.ExecuteNonQuery();
        //        try
        //        {
        //            Transaction.Commit();
        //        }
        //        catch (Exception ex)
        //        {
        //            MessageBox.Show("Commit Exception: " + ex.Message);
        //        }
        //        if ((int)EffectedRows == 0) throw new Exception("No rows effected. No player was added/removed from the roster.");
        //    }
        //    catch (SqlException ex)
        //    {
        //        MessageBox.Show("SQL Error Code " + ex.Number + ": " + ex.Message);
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show("Exception: " + ex.Message);
        //    }
        //    finally
        //    {
        //        connection1.Close();
        //    }
        //}
     

                }
            }
    