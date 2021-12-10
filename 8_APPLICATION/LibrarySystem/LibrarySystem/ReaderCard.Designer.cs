
namespace LibrarySystem
{
    partial class ReaderCard
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.AddReader = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.name = new System.Windows.Forms.TextBox();
            this.phone = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.address = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.work = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.pos = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.birth = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // AddReader
            // 
            this.AddReader.Location = new System.Drawing.Point(203, 250);
            this.AddReader.Name = "AddReader";
            this.AddReader.Size = new System.Drawing.Size(169, 42);
            this.AddReader.TabIndex = 0;
            this.AddReader.Text = "Добавить";
            this.AddReader.UseVisualStyleBackColor = true;
            this.AddReader.Click += new System.EventHandler(this.AddReader_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(79, 49);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Имя";
            // 
            // name
            // 
            this.name.Location = new System.Drawing.Point(82, 69);
            this.name.Name = "name";
            this.name.Size = new System.Drawing.Size(169, 22);
            this.name.TabIndex = 2;
            // 
            // phone
            // 
            this.phone.Location = new System.Drawing.Point(82, 127);
            this.phone.Name = "phone";
            this.phone.Size = new System.Drawing.Size(169, 22);
            this.phone.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(79, 107);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(182, 17);
            this.label2.TabIndex = 3;
            this.label2.Text = "Телефон (+78985679252):";
            // 
            // address
            // 
            this.address.Location = new System.Drawing.Point(82, 190);
            this.address.Name = "address";
            this.address.Size = new System.Drawing.Size(169, 22);
            this.address.TabIndex = 6;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(79, 170);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(52, 17);
            this.label3.TabIndex = 5;
            this.label3.Text = "Адрес:";
            // 
            // work
            // 
            this.work.Location = new System.Drawing.Point(321, 69);
            this.work.Name = "work";
            this.work.Size = new System.Drawing.Size(169, 22);
            this.work.TabIndex = 8;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(318, 49);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(106, 17);
            this.label4.TabIndex = 7;
            this.label4.Text = "Место работы:";
            // 
            // pos
            // 
            this.pos.Location = new System.Drawing.Point(321, 127);
            this.pos.Name = "pos";
            this.pos.Size = new System.Drawing.Size(169, 22);
            this.pos.TabIndex = 10;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(318, 107);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(85, 17);
            this.label5.TabIndex = 9;
            this.label5.Text = "Должность:";
            // 
            // birth
            // 
            this.birth.Location = new System.Drawing.Point(321, 190);
            this.birth.Name = "birth";
            this.birth.Size = new System.Drawing.Size(169, 22);
            this.birth.TabIndex = 12;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(318, 170);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(193, 17);
            this.label6.TabIndex = 11;
            this.label6.Text = "Дата рождения (гггг-мм-дд):";
            // 
            // ReaderCard
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(626, 340);
            this.Controls.Add(this.birth);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.pos);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.work);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.address);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.phone);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.name);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.AddReader);
            this.Name = "ReaderCard";
            this.Text = "Карточка читателя";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button AddReader;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox name;
        private System.Windows.Forms.TextBox phone;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox address;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox work;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox pos;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox birth;
        private System.Windows.Forms.Label label6;
    }
}